package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.character.alignment.ActorAlignmentInformations;
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameRolePlayCharacterInformations extends GameRolePlayHumanoidInformations implements INetworkType
   {
      
      public static const protocolId:uint = 36;
       
      
      public var alignmentInfos:ActorAlignmentInformations;
      
      public function GameRolePlayCharacterInformations()
      {
         this.alignmentInfos = new ActorAlignmentInformations();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 36;
      }
      
      public function initGameRolePlayCharacterInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:String = "", param5:HumanInformations = null, param6:ActorAlignmentInformations = null) : GameRolePlayCharacterInformations
      {
         super.initGameRolePlayHumanoidInformations(param1,param2,param3,param4,param5);
         this.alignmentInfos = param6;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.alignmentInfos = new ActorAlignmentInformations();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlayCharacterInformations(param1);
      }
      
      public function serializeAs_GameRolePlayCharacterInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameRolePlayHumanoidInformations(param1);
         this.alignmentInfos.serializeAs_ActorAlignmentInformations(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayCharacterInformations(param1);
      }
      
      public function deserializeAs_GameRolePlayCharacterInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.alignmentInfos = new ActorAlignmentInformations();
         this.alignmentInfos.deserialize(param1);
      }
   }
}
