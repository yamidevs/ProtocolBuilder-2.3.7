package com.ankamagames.dofus.network.messages.game.context.roleplay.houses
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class HouseToSellFilterMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6137;
       
      
      private var _isInitialized:Boolean = false;
      
      public var areaId:int = 0;
      
      public var atLeastNbRoom:int = 0;
      
      public var atLeastNbChest:int = 0;
      
      public var skillRequested:int = 0;
      
      public var maxPrice:uint = 0;
      
      public function HouseToSellFilterMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6137;
      }
      
      public function initHouseToSellFilterMessage(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:uint = 0) : HouseToSellFilterMessage
      {
         this.areaId = param1;
         this.atLeastNbRoom = param2;
         this.atLeastNbChest = param3;
         this.skillRequested = param4;
         this.maxPrice = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.areaId = 0;
         this.atLeastNbRoom = 0;
         this.atLeastNbChest = 0;
         this.skillRequested = 0;
         this.maxPrice = 0;
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
         this.serializeAs_HouseToSellFilterMessage(param1);
      }
      
      public function serializeAs_HouseToSellFilterMessage(param1:IDataOutput) : void
      {
         param1.writeInt(this.areaId);
         param1.writeByte(this.atLeastNbRoom);
         param1.writeByte(this.atLeastNbChest);
         param1.writeByte(this.skillRequested);
         if(this.maxPrice < 0)
         {
            throw new Error("Forbidden value (" + this.maxPrice + ") on element maxPrice.");
         }
         param1.writeInt(this.maxPrice);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HouseToSellFilterMessage(param1);
      }
      
      public function deserializeAs_HouseToSellFilterMessage(param1:IDataInput) : void
      {
         this.areaId = param1.readInt();
         this.atLeastNbRoom = param1.readByte();
         this.atLeastNbChest = param1.readByte();
         this.skillRequested = param1.readByte();
         this.maxPrice = param1.readInt();
         if(this.maxPrice < 0)
         {
            throw new Error("Forbidden value (" + this.maxPrice + ") on element of HouseToSellFilterMessage.maxPrice.");
         }
      }
   }
}
