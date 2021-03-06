package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeReplayCountModifiedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6023;
       
      
      private var _isInitialized:Boolean = false;
      
      public var count:int = 0;
      
      public function ExchangeReplayCountModifiedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6023;
      }
      
      public function initExchangeReplayCountModifiedMessage(param1:int = 0) : ExchangeReplayCountModifiedMessage
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
         this.serializeAs_ExchangeReplayCountModifiedMessage(param1);
      }
      
      public function serializeAs_ExchangeReplayCountModifiedMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.count);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeReplayCountModifiedMessage(param1);
      }
      
      public function deserializeAs_ExchangeReplayCountModifiedMessage(param1:IDataInput) : void
      {
         this.count = param1.readInt();
      }
   }
}
