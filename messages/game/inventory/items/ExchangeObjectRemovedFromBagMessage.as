package com.ankamagames.dofus.network.messages.game.inventory.items
{
   import com.ankamagames.dofus.network.messages.game.inventory.exchanges.ExchangeObjectMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeObjectRemovedFromBagMessage extends ExchangeObjectMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6010;
       
      
      private var _isInitialized:Boolean = false;
      
      public var objectUID:uint = 0;
      
      public function ExchangeObjectRemovedFromBagMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6010;
      }
      
      public function initExchangeObjectRemovedFromBagMessage(param1:Boolean = false, param2:uint = 0) : ExchangeObjectRemovedFromBagMessage
      {
         super.initExchangeObjectMessage(param1);
         this.objectUID = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.objectUID = 0;
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ExchangeObjectRemovedFromBagMessage(param1);
      }
      
      public function serializeAs_ExchangeObjectRemovedFromBagMessage(param1:IDataOutput) : void
      {
         super.serializeAs_ExchangeObjectMessage(param1);
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element objectUID.");
         }
         param1.writeInt(this.objectUID);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeObjectRemovedFromBagMessage(param1);
      }
      
      public function deserializeAs_ExchangeObjectRemovedFromBagMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.objectUID = param1.readInt();
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element of ExchangeObjectRemovedFromBagMessage.objectUID.");
         }
      }
   }
}
