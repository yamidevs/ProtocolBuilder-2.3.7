package com.ankamagames.dofus.network.messages.common.basic
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class BasicPongMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 183;
       
      
      private var _isInitialized:Boolean = false;
      
      public var quiet:Boolean = false;
      
      public function BasicPongMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 183;
      }
      
      public function initBasicPongMessage(param1:Boolean = false) : BasicPongMessage
      {
         this.quiet = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.quiet = false;
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
         this.serializeAs_BasicPongMessage(param1);
      }
      
      public function serializeAs_BasicPongMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.quiet);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_BasicPongMessage(param1);
      }
      
      public function deserializeAs_BasicPongMessage(param1:IDataInput) : void
      {
         this.quiet = param1.readBoolean();
      }
   }
}
