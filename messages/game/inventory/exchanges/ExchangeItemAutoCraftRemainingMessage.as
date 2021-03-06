package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeItemAutoCraftRemainingMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6015;
       
      
      private var _isInitialized:Boolean = false;
      
      public var count:uint = 0;
      
      public function ExchangeItemAutoCraftRemainingMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6015;
      }
      
      public function initExchangeItemAutoCraftRemainingMessage(param1:uint = 0) : ExchangeItemAutoCraftRemainingMessage
      {
         this.count = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.count = 0;
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
         this.serializeAs_ExchangeItemAutoCraftRemainingMessage(param1);
      }
      
      public function serializeAs_ExchangeItemAutoCraftRemainingMessage(param1:IDataOutput) : void
      {
         if(this.count < 0)
         {
            throw new Error("Forbidden value (" + this.count + ") on element count.");
         }
         param1.writeInt(this.count);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeItemAutoCraftRemainingMessage(param1);
      }
      
      public function deserializeAs_ExchangeItemAutoCraftRemainingMessage(param1:IDataInput) : void
      {
         this.count = param1.readInt();
         if(this.count < 0)
         {
            throw new Error("Forbidden value (" + this.count + ") on element of ExchangeItemAutoCraftRemainingMessage.count.");
         }
      }
   }
}
