package com.ankamagames.dofus.network.messages.updater.parts
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GetPartInfoMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1506;
       
      
      private var _isInitialized:Boolean = false;
      
      public var id:String = "";
      
      public function GetPartInfoMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1506;
      }
      
      public function initGetPartInfoMessage(param1:String = "") : GetPartInfoMessage
      {
         this.id = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.id = "";
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
         this.serializeAs_GetPartInfoMessage(param1);
      }
      
      public function serializeAs_GetPartInfoMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.id);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GetPartInfoMessage(param1);
      }
      
      public function deserializeAs_GetPartInfoMessage(param1:IDataInput) : void
      {
         this.id = param1.readUTF();
      }
   }
}
