package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeBidHouseInListAddedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5949;
       
      
      private var _isInitialized:Boolean = false;
      
      public var itemUID:int = 0;
      
      public var objGenericId:int = 0;
      
      public var powerRate:int = 0;
      
      public var overMax:Boolean = false;
      
      public var effects:Vector.<ObjectEffect>;
      
      public var prices:Vector.<uint>;
      
      public function ExchangeBidHouseInListAddedMessage()
      {
         this.effects = new Vector.<ObjectEffect>();
         this.prices = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5949;
      }
      
      public function initExchangeBidHouseInListAddedMessage(param1:int = 0, param2:int = 0, param3:int = 0, param4:Boolean = false, param5:Vector.<ObjectEffect> = null, param6:Vector.<uint> = null) : ExchangeBidHouseInListAddedMessage
      {
         this.itemUID = param1;
         this.objGenericId = param2;
         this.powerRate = param3;
         this.overMax = param4;
         this.effects = param5;
         this.prices = param6;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.itemUID = 0;
         this.objGenericId = 0;
         this.powerRate = 0;
         this.overMax = false;
         this.effects = new Vector.<ObjectEffect>();
         this.prices = new Vector.<uint>();
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
         this.serializeAs_ExchangeBidHouseInListAddedMessage(param1);
      }
      
      public function serializeAs_ExchangeBidHouseInListAddedMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.itemUID);
         param1.writeInt(this.objGenericId);
         param1.writeShort(this.powerRate);
         param1.writeBoolean(this.overMax);
         param1.writeShort(this.effects.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.effects.length)
         {
            param1.writeShort((this.effects[_loc2_] as ObjectEffect).getTypeId());
            (this.effects[_loc2_] as ObjectEffect).serialize(param1);
            _loc2_++;
         }
         param1.writeShort(this.prices.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.prices.length)
         {
            if(this.prices[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.prices[_loc3_] + ") on element 6 (starting at 1) of prices.");
            }
            param1.writeInt(this.prices[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeBidHouseInListAddedMessage(param1);
      }
      
      public function deserializeAs_ExchangeBidHouseInListAddedMessage(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:ObjectEffect = null;
         var _loc8_:uint = 0;
         this.itemUID = param1.readInt();
         this.objGenericId = param1.readInt();
         this.powerRate = param1.readShort();
         this.overMax = param1.readBoolean();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readUnsignedShort();
            _loc7_ = ProtocolTypeManager.getInstance(ObjectEffect,_loc6_);
            _loc7_.deserialize(param1);
            this.effects.push(_loc7_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = param1.readInt();
            if(_loc8_ < 0)
            {
               throw new Error("Forbidden value (" + _loc8_ + ") on elements of prices.");
            }
            this.prices.push(_loc8_);
            _loc5_++;
         }
      }
   }
}
