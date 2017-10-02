package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class IgnoredDeleteRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5680;
       
      
      private var _isInitialized:Boolean = false;
      
      public var name:String = "";
      
      public var session:Boolean = false;
      
      public function IgnoredDeleteRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5680;
      }
      
      public function initIgnoredDeleteRequestMessage(param1:String = "", param2:Boolean = false) : IgnoredDeleteRequestMessage
      {
         this.name = param1;
         this.session = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.name = "";
         this.session = false;
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_IgnoredDeleteRequestMessage(param1);
      }
      
      public function serializeAs_IgnoredDeleteRequestMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name);
         param1.writeBoolean(this.session);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_IgnoredDeleteRequestMessage(param1);
      }
      
      public function deserializeAs_IgnoredDeleteRequestMessage(param1:IDataInput) : void
      {
         this.name = param1.readUTF();
         this.session = param1.readBoolean();
      }
   }
}
