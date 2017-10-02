package com.ankamagames.dofus.network.types.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PartyUpdateCommonsInformations implements INetworkType
   {
      
      public static const protocolId:uint = 213;
       
      
      public var lifePoints:uint = 0;
      
      public var maxLifePoints:uint = 0;
      
      public var prospecting:uint = 0;
      
      public var regenRate:uint = 0;
      
      public function PartyUpdateCommonsInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 213;
      }
      
      public function initPartyUpdateCommonsInformations(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0) : PartyUpdateCommonsInformations
      {
         this.lifePoints = param1;
         this.maxLifePoints = param2;
         this.prospecting = param3;
         this.regenRate = param4;
         return this;
      }
      
      public function reset() : void
      {
         this.lifePoints = 0;
         this.maxLifePoints = 0;
         this.prospecting = 0;
         this.regenRate = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_PartyUpdateCommonsInformations(param1);
      }
      
      public function serializeAs_PartyUpdateCommonsInformations(param1:IDataOutput) : void
      {
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element lifePoints.");
         }
         param1.writeInt(this.lifePoints);
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element maxLifePoints.");
         }
         param1.writeInt(this.maxLifePoints);
         if(this.prospecting < 0)
         {
            throw new Error("Forbidden value (" + this.prospecting + ") on element prospecting.");
         }
         param1.writeShort(this.prospecting);
         if(this.regenRate < 0 || this.regenRate > 255)
         {
            throw new Error("Forbidden value (" + this.regenRate + ") on element regenRate.");
         }
         param1.writeByte(this.regenRate);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyUpdateCommonsInformations(param1);
      }
      
      public function deserializeAs_PartyUpdateCommonsInformations(param1:IDataInput) : void
      {
         this.lifePoints = param1.readInt();
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element of PartyUpdateCommonsInformations.lifePoints.");
         }
         this.maxLifePoints = param1.readInt();
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element of PartyUpdateCommonsInformations.maxLifePoints.");
         }
         this.prospecting = param1.readShort();
         if(this.prospecting < 0)
         {
            throw new Error("Forbidden value (" + this.prospecting + ") on element of PartyUpdateCommonsInformations.prospecting.");
         }
         this.regenRate = param1.readUnsignedByte();
         if(this.regenRate < 0 || this.regenRate > 255)
         {
            throw new Error("Forbidden value (" + this.regenRate + ") on element of PartyUpdateCommonsInformations.regenRate.");
         }
      }
   }
}
