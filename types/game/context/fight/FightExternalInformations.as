package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FightExternalInformations implements INetworkType
   {
      
      public static const protocolId:uint = 117;
       
      
      public var fightId:int = 0;
      
      public var fightStart:uint = 0;
      
      public var fightSpectatorLocked:Boolean = false;
      
      public var fightTeams:Vector.<FightTeamLightInformations>;
      
      public var fightTeamsOptions:Vector.<FightOptionsInformations>;
      
      public function FightExternalInformations()
      {
         this.fightTeams = new Vector.<FightTeamLightInformations>(2,true);
         this.fightTeamsOptions = new Vector.<FightOptionsInformations>(2,true);
         super();
      }
      
      public function getTypeId() : uint
      {
         return 117;
      }
      
      public function initFightExternalInformations(param1:int = 0, param2:uint = 0, param3:Boolean = false, param4:Vector.<FightTeamLightInformations> = null, param5:Vector.<FightOptionsInformations> = null) : FightExternalInformations
      {
         this.fightId = param1;
         this.fightStart = param2;
         this.fightSpectatorLocked = param3;
         this.fightTeams = param4;
         this.fightTeamsOptions = param5;
         return this;
      }
      
      public function reset() : void
      {
         this.fightId = 0;
         this.fightStart = 0;
         this.fightSpectatorLocked = false;
         this.fightTeams = new Vector.<FightTeamLightInformations>(2,true);
         this.fightTeamsOptions = new Vector.<FightOptionsInformations>(2,true);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FightExternalInformations(param1);
      }
      
      public function serializeAs_FightExternalInformations(param1:IDataOutput) : void
      {
         param1.writeInt(this.fightId);
         if(this.fightStart < 0)
         {
            throw new Error("Forbidden value (" + this.fightStart + ") on element fightStart.");
         }
         param1.writeInt(this.fightStart);
         param1.writeBoolean(this.fightSpectatorLocked);
         var _loc2_:uint = 0;
         while(_loc2_ < 2)
         {
            this.fightTeams[_loc2_].serializeAs_FightTeamLightInformations(param1);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < 2)
         {
            this.fightTeamsOptions[_loc3_].serializeAs_FightOptionsInformations(param1);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FightExternalInformations(param1);
      }
      
      public function deserializeAs_FightExternalInformations(param1:IDataInput) : void
      {
         this.fightId = param1.readInt();
         this.fightStart = param1.readInt();
         if(this.fightStart < 0)
         {
            throw new Error("Forbidden value (" + this.fightStart + ") on element of FightExternalInformations.fightStart.");
         }
         this.fightSpectatorLocked = param1.readBoolean();
         var _loc2_:uint = 0;
         while(_loc2_ < 2)
         {
            this.fightTeams[_loc2_] = new FightTeamLightInformations();
            this.fightTeams[_loc2_].deserialize(param1);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < 2)
         {
            this.fightTeamsOptions[_loc3_] = new FightOptionsInformations();
            this.fightTeamsOptions[_loc3_].deserialize(param1);
            _loc3_++;
         }
      }
   }
}
