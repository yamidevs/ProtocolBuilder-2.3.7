package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeBuyMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5774;
       
      
      private var _isInitialized:Boolean = false;
      
      public var objectToBuyId:uint = 0;
      
      public var quantity:uint = 0;
      
      public function ExchangeBuyMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5774;
      }
      
      public function initExchangeBuyMessage(param1:uint = 0, param2:uint = 0) : ExchangeBuyMessage
      {
         this.objectToBuyId = param1;
         this.quantity = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.objectToBuyId = 0;
         this.quantity = 0;
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
         this.serializeAs_ExchangeBuyMessage(param1);
      }
      
      public function serializeAs_ExchangeBuyMessage(param1:IDataOutput) : void
      {
         if(this.objectToBuyId < 0)
         {
            throw new Error("Forbidden value (" + this.objectToBuyId + ") on element objectToBuyId.");
         }
         param1.writeInt(this.objectToBuyId);
         if(this.quantity < 0)
         {
            throw new Error("Forbidden value (" + this.quantity + ") on element quantity.");
         }
         param1.writeInt(this.quantity);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeBuyMessage(param1);
      }
      
      public function deserializeAs_ExchangeBuyMessage(param1:IDataInput) : void
      {
         this.objectToBuyId = param1.readInt();
         if(this.objectToBuyId < 0)
         {
            throw new Error("Forbidden value (" + this.objectToBuyId + ") on element of ExchangeBuyMessage.objectToBuyId.");
         }
         this.quantity = param1.readInt();
         if(this.quantity < 0)
         {
            throw new Error("Forbidden value (" + this.quantity + ") on element of ExchangeBuyMessage.quantity.");
         }
      }
   }
}
