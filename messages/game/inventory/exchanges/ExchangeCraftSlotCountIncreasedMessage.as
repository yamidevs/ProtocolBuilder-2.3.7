package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeCraftSlotCountIncreasedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6125;
       
      
      private var _isInitialized:Boolean = false;
      
      public var newMaxSlot:uint = 0;
      
      public function ExchangeCraftSlotCountIncreasedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6125;
      }
      
      public function initExchangeCraftSlotCountIncreasedMessage(param1:uint = 0) : ExchangeCraftSlotCountIncreasedMessage
      {
         this.newMaxSlot = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.newMaxSlot = 0;
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
         this.serializeAs_ExchangeCraftSlotCountIncreasedMessage(param1);
      }
      
      public function serializeAs_ExchangeCraftSlotCountIncreasedMessage(param1:IDataOutput) : void
      {
         if(this.newMaxSlot < 0)
         {
            throw new Error("Forbidden value (" + this.newMaxSlot + ") on element newMaxSlot.");
         }
         param1.writeByte(this.newMaxSlot);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeCraftSlotCountIncreasedMessage(param1);
      }
      
      public function deserializeAs_ExchangeCraftSlotCountIncreasedMessage(param1:IDataInput) : void
      {
         this.newMaxSlot = param1.readByte();
         if(this.newMaxSlot < 0)
         {
            throw new Error("Forbidden value (" + this.newMaxSlot + ") on element of ExchangeCraftSlotCountIncreasedMessage.newMaxSlot.");
         }
      }
   }
}
