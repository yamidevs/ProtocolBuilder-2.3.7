package com.ankamagames.dofus.network.types.game.house
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class HouseInformationsForGuild implements INetworkType
   {
      
      public static const protocolId:uint = 170;
       
      
      public var houseId:uint = 0;
      
      public var modelId:uint = 0;
      
      public var ownerName:String = "";
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var skillListIds:Vector.<int>;
      
      public var guildshareParams:uint = 0;
      
      public function HouseInformationsForGuild()
      {
         this.skillListIds = new Vector.<int>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 170;
      }
      
      public function initHouseInformationsForGuild(param1:uint = 0, param2:uint = 0, param3:String = "", param4:int = 0, param5:int = 0, param6:Vector.<int> = null, param7:uint = 0) : HouseInformationsForGuild
      {
         this.houseId = param1;
         this.modelId = param2;
         this.ownerName = param3;
         this.worldX = param4;
         this.worldY = param5;
         this.skillListIds = param6;
         this.guildshareParams = param7;
         return this;
      }
      
      public function reset() : void
      {
         this.houseId = 0;
         this.modelId = 0;
         this.ownerName = "";
         this.worldX = 0;
         this.worldY = 0;
         this.skillListIds = new Vector.<int>();
         this.guildshareParams = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_HouseInformationsForGuild(param1);
      }
      
      public function serializeAs_HouseInformationsForGuild(param1:IDataOutput) : void
      {
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element houseId.");
         }
         param1.writeInt(this.houseId);
         if(this.modelId < 0)
         {
            throw new Error("Forbidden value (" + this.modelId + ") on element modelId.");
         }
         param1.writeInt(this.modelId);
         param1.writeUTF(this.ownerName);
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
         param1.writeShort(this.skillListIds.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.skillListIds.length)
         {
            param1.writeInt(this.skillListIds[_loc2_]);
            _loc2_++;
         }
         if(this.guildshareParams < 0 || this.guildshareParams > 4294967295)
         {
            throw new Error("Forbidden value (" + this.guildshareParams + ") on element guildshareParams.");
         }
         param1.writeUnsignedInt(this.guildshareParams);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HouseInformationsForGuild(param1);
      }
      
      public function deserializeAs_HouseInformationsForGuild(param1:IDataInput) : void
      {
         var _loc4_:int = 0;
         this.houseId = param1.readInt();
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element of HouseInformationsForGuild.houseId.");
         }
         this.modelId = param1.readInt();
         if(this.modelId < 0)
         {
            throw new Error("Forbidden value (" + this.modelId + ") on element of HouseInformationsForGuild.modelId.");
         }
         this.ownerName = param1.readUTF();
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of HouseInformationsForGuild.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of HouseInformationsForGuild.worldY.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            this.skillListIds.push(_loc4_);
            _loc3_++;
         }
         this.guildshareParams = param1.readUnsignedInt();
         if(this.guildshareParams < 0 || this.guildshareParams > 4294967295)
         {
            throw new Error("Forbidden value (" + this.guildshareParams + ") on element of HouseInformationsForGuild.guildshareParams.");
         }
      }
   }
}
