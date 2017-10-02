package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismBalanceResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5841;
       
      
      private var _isInitialized:Boolean = false;
      
      public var totalBalanceValue:uint = 0;
      
      public var subAreaBalanceValue:uint = 0;
      
      public function PrismBalanceResultMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5841;
      }
      
      public function initPrismBalanceResultMessage(param1:uint = 0, param2:uint = 0) : PrismBalanceResultMessage
      {
         this.totalBalanceValue = param1;
         this.subAreaBalanceValue = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.totalBalanceValue = 0;
         this.subAreaBalanceValue = 0;
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
         this.serializeAs_PrismBalanceResultMessage(param1);
      }
      
      public function serializeAs_PrismBalanceResultMessage(param1:IDataOutput) : void
      {
         if(this.totalBalanceValue < 0)
         {
            throw new Error("Forbidden value (" + this.totalBalanceValue + ") on element totalBalanceValue.");
         }
         param1.writeByte(this.totalBalanceValue);
         if(this.subAreaBalanceValue < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaBalanceValue + ") on element subAreaBalanceValue.");
         }
         param1.writeByte(this.subAreaBalanceValue);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismBalanceResultMessage(param1);
      }
      
      public function deserializeAs_PrismBalanceResultMessage(param1:IDataInput) : void
      {
         this.totalBalanceValue = param1.readByte();
         if(this.totalBalanceValue < 0)
         {
            throw new Error("Forbidden value (" + this.totalBalanceValue + ") on element of PrismBalanceResultMessage.totalBalanceValue.");
         }
         this.subAreaBalanceValue = param1.readByte();
         if(this.subAreaBalanceValue < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaBalanceValue + ") on element of PrismBalanceResultMessage.subAreaBalanceValue.");
         }
      }
   }
}
