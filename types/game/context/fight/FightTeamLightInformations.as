package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FightTeamLightInformations extends AbstractFightTeamInformations implements INetworkType
   {
      
      public static const protocolId:uint = 115;
       
      
      public var teamMembersCount:uint = 0;
      
      public function FightTeamLightInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 115;
      }
      
      public function initFightTeamLightInformations(param1:uint = 2, param2:int = 0, param3:int = 0, param4:uint = 0, param5:uint = 0) : FightTeamLightInformations
      {
         super.initAbstractFightTeamInformations(param1,param2,param3,param4);
         this.teamMembersCount = param5;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.teamMembersCount = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FightTeamLightInformations(param1);
      }
      
      public function serializeAs_FightTeamLightInformations(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractFightTeamInformations(param1);
         if(this.teamMembersCount < 0)
         {
            throw new Error("Forbidden value (" + this.teamMembersCount + ") on element teamMembersCount.");
         }
         param1.writeByte(this.teamMembersCount);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FightTeamLightInformations(param1);
      }
      
      public function deserializeAs_FightTeamLightInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.teamMembersCount = param1.readByte();
         if(this.teamMembersCount < 0)
         {
            throw new Error("Forbidden value (" + this.teamMembersCount + ") on element of FightTeamLightInformations.teamMembersCount.");
         }
      }
   }
}
