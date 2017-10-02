package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameFightMinimalStats implements INetworkType
   {
      
      public static const protocolId:uint = 31;
       
      
      public var lifePoints:uint = 0;
      
      public var maxLifePoints:uint = 0;
      
      public var baseMaxLifePoints:uint = 0;
      
      public var permanentDamagePercent:uint = 0;
      
      public var shieldPoints:uint = 0;
      
      public var actionPoints:int = 0;
      
      public var movementPoints:int = 0;
      
      public var summoner:int = 0;
      
      public var neutralElementResistPercent:int = 0;
      
      public var earthElementResistPercent:int = 0;
      
      public var waterElementResistPercent:int = 0;
      
      public var airElementResistPercent:int = 0;
      
      public var fireElementResistPercent:int = 0;
      
      public var dodgePALostProbability:uint = 0;
      
      public var dodgePMLostProbability:uint = 0;
      
      public var tackleBlock:uint = 0;
      
      public var tackleEvade:uint = 0;
      
      public var invisibilityState:int = 0;
      
      public function GameFightMinimalStats()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 31;
      }
      
      public function initGameFightMinimalStats(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:uint = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0, param11:int = 0, param12:int = 0, param13:int = 0, param14:uint = 0, param15:uint = 0, param16:uint = 0, param17:uint = 0, param18:int = 0) : GameFightMinimalStats
      {
         this.lifePoints = param1;
         this.maxLifePoints = param2;
         this.baseMaxLifePoints = param3;
         this.permanentDamagePercent = param4;
         this.shieldPoints = param5;
         this.actionPoints = param6;
         this.movementPoints = param7;
         this.summoner = param8;
         this.neutralElementResistPercent = param9;
         this.earthElementResistPercent = param10;
         this.waterElementResistPercent = param11;
         this.airElementResistPercent = param12;
         this.fireElementResistPercent = param13;
         this.dodgePALostProbability = param14;
         this.dodgePMLostProbability = param15;
         this.tackleBlock = param16;
         this.tackleEvade = param17;
         this.invisibilityState = param18;
         return this;
      }
      
      public function reset() : void
      {
         this.lifePoints = 0;
         this.maxLifePoints = 0;
         this.baseMaxLifePoints = 0;
         this.permanentDamagePercent = 0;
         this.shieldPoints = 0;
         this.actionPoints = 0;
         this.movementPoints = 0;
         this.summoner = 0;
         this.neutralElementResistPercent = 0;
         this.earthElementResistPercent = 0;
         this.waterElementResistPercent = 0;
         this.airElementResistPercent = 0;
         this.fireElementResistPercent = 0;
         this.dodgePALostProbability = 0;
         this.dodgePMLostProbability = 0;
         this.tackleBlock = 0;
         this.tackleEvade = 0;
         this.invisibilityState = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameFightMinimalStats(param1);
      }
      
      public function serializeAs_GameFightMinimalStats(param1:IDataOutput) : void
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
         if(this.baseMaxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.baseMaxLifePoints + ") on element baseMaxLifePoints.");
         }
         param1.writeInt(this.baseMaxLifePoints);
         if(this.permanentDamagePercent < 0)
         {
            throw new Error("Forbidden value (" + this.permanentDamagePercent + ") on element permanentDamagePercent.");
         }
         param1.writeInt(this.permanentDamagePercent);
         if(this.shieldPoints < 0)
         {
            throw new Error("Forbidden value (" + this.shieldPoints + ") on element shieldPoints.");
         }
         param1.writeInt(this.shieldPoints);
         param1.writeShort(this.actionPoints);
         param1.writeShort(this.movementPoints);
         param1.writeInt(this.summoner);
         param1.writeShort(this.neutralElementResistPercent);
         param1.writeShort(this.earthElementResistPercent);
         param1.writeShort(this.waterElementResistPercent);
         param1.writeShort(this.airElementResistPercent);
         param1.writeShort(this.fireElementResistPercent);
         if(this.dodgePALostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePALostProbability + ") on element dodgePALostProbability.");
         }
         param1.writeShort(this.dodgePALostProbability);
         if(this.dodgePMLostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePMLostProbability + ") on element dodgePMLostProbability.");
         }
         param1.writeShort(this.dodgePMLostProbability);
         if(this.tackleBlock < 0)
         {
            throw new Error("Forbidden value (" + this.tackleBlock + ") on element tackleBlock.");
         }
         param1.writeShort(this.tackleBlock);
         if(this.tackleEvade < 0)
         {
            throw new Error("Forbidden value (" + this.tackleEvade + ") on element tackleEvade.");
         }
         param1.writeShort(this.tackleEvade);
         param1.writeByte(this.invisibilityState);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameFightMinimalStats(param1);
      }
      
      public function deserializeAs_GameFightMinimalStats(param1:IDataInput) : void
      {
         this.lifePoints = param1.readInt();
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element of GameFightMinimalStats.lifePoints.");
         }
         this.maxLifePoints = param1.readInt();
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element of GameFightMinimalStats.maxLifePoints.");
         }
         this.baseMaxLifePoints = param1.readInt();
         if(this.baseMaxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.baseMaxLifePoints + ") on element of GameFightMinimalStats.baseMaxLifePoints.");
         }
         this.permanentDamagePercent = param1.readInt();
         if(this.permanentDamagePercent < 0)
         {
            throw new Error("Forbidden value (" + this.permanentDamagePercent + ") on element of GameFightMinimalStats.permanentDamagePercent.");
         }
         this.shieldPoints = param1.readInt();
         if(this.shieldPoints < 0)
         {
            throw new Error("Forbidden value (" + this.shieldPoints + ") on element of GameFightMinimalStats.shieldPoints.");
         }
         this.actionPoints = param1.readShort();
         this.movementPoints = param1.readShort();
         this.summoner = param1.readInt();
         this.neutralElementResistPercent = param1.readShort();
         this.earthElementResistPercent = param1.readShort();
         this.waterElementResistPercent = param1.readShort();
         this.airElementResistPercent = param1.readShort();
         this.fireElementResistPercent = param1.readShort();
         this.dodgePALostProbability = param1.readShort();
         if(this.dodgePALostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePALostProbability + ") on element of GameFightMinimalStats.dodgePALostProbability.");
         }
         this.dodgePMLostProbability = param1.readShort();
         if(this.dodgePMLostProbability < 0)
         {
            throw new Error("Forbidden value (" + this.dodgePMLostProbability + ") on element of GameFightMinimalStats.dodgePMLostProbability.");
         }
         this.tackleBlock = param1.readShort();
         if(this.tackleBlock < 0)
         {
            throw new Error("Forbidden value (" + this.tackleBlock + ") on element of GameFightMinimalStats.tackleBlock.");
         }
         this.tackleEvade = param1.readShort();
         if(this.tackleEvade < 0)
         {
            throw new Error("Forbidden value (" + this.tackleEvade + ") on element of GameFightMinimalStats.tackleEvade.");
         }
         this.invisibilityState = param1.readByte();
      }
   }
}
