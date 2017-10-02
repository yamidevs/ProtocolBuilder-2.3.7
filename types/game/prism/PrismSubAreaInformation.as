package com.ankamagames.dofus.network.types.game.prism
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PrismSubAreaInformation implements INetworkType
   {
      
      public static const protocolId:uint = 142;
       
      
      public var subId:uint = 0;
      
      public var alignment:uint = 0;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public var isInFight:Boolean = false;
      
      public var isFightable:Boolean = false;
      
      public function PrismSubAreaInformation()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 142;
      }
      
      public function initPrismSubAreaInformation(param1:uint = 0, param2:uint = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false) : PrismSubAreaInformation
      {
         this.subId = param1;
         this.alignment = param2;
         this.worldX = param3;
         this.worldY = param4;
         this.mapId = param5;
         this.isInFight = param6;
         this.isFightable = param7;
         return this;
      }
      
      public function reset() : void
      {
         this.subId = 0;
         this.alignment = 0;
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
         this.isInFight = false;
         this.isFightable = false;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_PrismSubAreaInformation(param1);
      }
      
      public function serializeAs_PrismSubAreaInformation(param1:IDataOutput) : void
      {
         if(this.subId < 0)
         {
            throw new Error("Forbidden value (" + this.subId + ") on element subId.");
         }
         param1.writeInt(this.subId);
         if(this.alignment < 0)
         {
            throw new Error("Forbidden value (" + this.alignment + ") on element alignment.");
         }
         param1.writeByte(this.alignment);
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
         param1.writeBoolean(this.isInFight);
         param1.writeBoolean(this.isFightable);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismSubAreaInformation(param1);
      }
      
      public function deserializeAs_PrismSubAreaInformation(param1:IDataInput) : void
      {
         this.subId = param1.readInt();
         if(this.subId < 0)
         {
            throw new Error("Forbidden value (" + this.subId + ") on element of PrismSubAreaInformation.subId.");
         }
         this.alignment = param1.readByte();
         if(this.alignment < 0)
         {
            throw new Error("Forbidden value (" + this.alignment + ") on element of PrismSubAreaInformation.alignment.");
         }
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of PrismSubAreaInformation.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of PrismSubAreaInformation.worldY.");
         }
         this.mapId = param1.readInt();
         this.isInFight = param1.readBoolean();
         this.isFightable = param1.readBoolean();
      }
   }
}
