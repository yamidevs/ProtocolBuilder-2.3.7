package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameRolePlayHumanoidInformations extends GameRolePlayNamedActorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 159;
       
      
      public var humanoidInfo:HumanInformations;
      
      public function GameRolePlayHumanoidInformations()
      {
         this.humanoidInfo = new HumanInformations();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 159;
      }
      
      public function initGameRolePlayHumanoidInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:String = "", param5:HumanInformations = null) : GameRolePlayHumanoidInformations
      {
         super.initGameRolePlayNamedActorInformations(param1,param2,param3,param4);
         this.humanoidInfo = param5;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.humanoidInfo = new HumanInformations();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlayHumanoidInformations(param1);
      }
      
      public function serializeAs_GameRolePlayHumanoidInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameRolePlayNamedActorInformations(param1);
         param1.writeShort(this.humanoidInfo.getTypeId());
         this.humanoidInfo.serialize(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayHumanoidInformations(param1);
      }
      
      public function deserializeAs_GameRolePlayHumanoidInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         this.humanoidInfo = ProtocolTypeManager.getInstance(HumanInformations,_loc2_);
         this.humanoidInfo.deserialize(param1);
      }
   }
}
