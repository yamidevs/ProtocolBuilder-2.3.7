package com.ankamagames.dofus.network.types.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyMemberGeoPosition implements INetworkType
   {
      
      public static const protocolId:uint = 378;
       
      
      public var memberId:uint = 0;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public function PartyMemberGeoPosition()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 378;
      }
      
      public function initPartyMemberGeoPosition(param1:uint = 0, param2:int = 0, param3:int = 0, param4:int = 0) : PartyMemberGeoPosition
      {
         this.memberId = param1;
         this.worldX = param2;
         this.worldY = param3;
         this.mapId = param4;
         return this;
      }
      
      public function reset() : void
      {
         this.memberId = 0;
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_PartyMemberGeoPosition(param1);
      }
      
      public function serializeAs_PartyMemberGeoPosition(param1:IDataOutput) : void
      {
         if(this.memberId < 0)
         {
            throw new Error("Forbidden value (" + this.memberId + ") on element memberId.");
         }
         param1.writeInt(this.memberId);
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
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyMemberGeoPosition(param1);
      }
      
      public function deserializeAs_PartyMemberGeoPosition(param1:IDataInput) : void
      {
         this.memberId = param1.readInt();
         if(this.memberId < 0)
         {
            throw new Error("Forbidden value (" + this.memberId + ") on element of PartyMemberGeoPosition.memberId.");
         }
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of PartyMemberGeoPosition.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of PartyMemberGeoPosition.worldY.");
         }
         this.mapId = param1.readInt();
      }
   }
}
