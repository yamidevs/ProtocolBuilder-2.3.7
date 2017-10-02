package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameRolePlayMutantInformations extends GameRolePlayHumanoidInformations implements INetworkType
   {
      
      public static const protocolId:uint = 3;
       
      
      public var monsterId:int = 0;
      
      public var powerLevel:int = 0;
      
      public function GameRolePlayMutantInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 3;
      }
      
      public function initGameRolePlayMutantInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:String = "", param5:HumanInformations = null, param6:int = 0, param7:int = 0) : GameRolePlayMutantInformations
      {
         super.initGameRolePlayHumanoidInformations(param1,param2,param3,param4,param5);
         this.monsterId = param6;
         this.powerLevel = param7;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.monsterId = 0;
         this.powerLevel = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlayMutantInformations(param1);
      }
      
      public function serializeAs_GameRolePlayMutantInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameRolePlayHumanoidInformations(param1);
         param1.writeInt(this.monsterId);
         param1.writeByte(this.powerLevel);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayMutantInformations(param1);
      }
      
      public function deserializeAs_GameRolePlayMutantInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.monsterId = param1.readInt();
         this.powerLevel = param1.readByte();
      }
   }
}
