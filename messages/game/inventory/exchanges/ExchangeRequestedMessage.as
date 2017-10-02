package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeRequestedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5522;
       
      
      private var _isInitialized:Boolean = false;
      
      public var exchangeType:int = 0;
      
      public function ExchangeRequestedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5522;
      }
      
      public function initExchangeRequestedMessage(param1:int = 0) : ExchangeRequestedMessage
      {
         this.exchangeType = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.exchangeType = 0;
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
         this.serializeAs_ExchangeRequestedMessage(param1);
      }
      
      public function serializeAs_ExchangeRequestedMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.exchangeType);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeRequestedMessage(param1);
      }
      
      public function deserializeAs_ExchangeRequestedMessage(param1:IDataInput) : void
      {
         this.exchangeType = param1.readByte();
      }
   }
}
