package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.dofus.network.types.game.data.items.ObjectItemQuantity;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ExchangeGuildTaxCollectorGetMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5762;
       
      
      private var _isInitialized:Boolean = false;
      
      public var collectorName:String = "";
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public var userName:String = "";
      
      public var experience:Number = 0;
      
      public var objectsInfos:Vector.<ObjectItemQuantity>;
      
      public function ExchangeGuildTaxCollectorGetMessage()
      {
         this.objectsInfos = new Vector.<ObjectItemQuantity>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5762;
      }
      
      public function initExchangeGuildTaxCollectorGetMessage(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0, param5:String = "", param6:Number = 0, param7:Vector.<ObjectItemQuantity> = null) : ExchangeGuildTaxCollectorGetMessage
      {
         this.collectorName = param1;
         this.worldX = param2;
         this.worldY = param3;
         this.mapId = param4;
         this.userName = param5;
         this.experience = param6;
         this.objectsInfos = param7;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.collectorName = "";
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
         this.userName = "";
         this.experience = 0;
         this.objectsInfos = new Vector.<ObjectItemQuantity>();
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
         this.serializeAs_ExchangeGuildTaxCollectorGetMessage(param1);
      }
      
      public function serializeAs_ExchangeGuildTaxCollectorGetMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.collectorName);
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element worldX.");
         }
         param1.writeShort(this.worldX);
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element worldY.");
         }
         param1.writeShort(this.worldY);
         param1.writeInt(this.mapId);
         param1.writeUTF(this.userName);
         param1.writeDouble(this.experience);
         param1.writeShort(this.objectsInfos.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.objectsInfos.length)
         {
            (this.objectsInfos[_loc2_] as ObjectItemQuantity).serializeAs_ObjectItemQuantity(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ExchangeGuildTaxCollectorGetMessage(param1);
      }
      
      public function deserializeAs_ExchangeGuildTaxCollectorGetMessage(param1:IDataInput) : void
      {
         var _loc4_:ObjectItemQuantity = null;
         this.collectorName = param1.readUTF();
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of ExchangeGuildTaxCollectorGetMessage.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of ExchangeGuildTaxCollectorGetMessage.worldY.");
         }
         this.mapId = param1.readInt();
         this.userName = param1.readUTF();
         this.experience = param1.readDouble();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new ObjectItemQuantity();
            _loc4_.deserialize(param1);
            this.objectsInfos.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
