package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.character.alignment.ActorAlignmentInformations;
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameRolePlayPrismInformations extends GameRolePlayActorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 161;
       
      
      public var alignInfos:ActorAlignmentInformations;
      
      public function GameRolePlayPrismInformations()
      {
         this.alignInfos = new ActorAlignmentInformations();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 161;
      }
      
      public function initGameRolePlayPrismInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:ActorAlignmentInformations = null) : GameRolePlayPrismInformations
      {
         super.initGameRolePlayActorInformations(param1,param2,param3);
         this.alignInfos = param4;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.alignInfos = new ActorAlignmentInformations();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlayPrismInformations(param1);
      }
      
      public function serializeAs_GameRolePlayPrismInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameRolePlayActorInformations(param1);
         this.alignInfos.serializeAs_ActorAlignmentInformations(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayPrismInformations(param1);
      }
      
      public function deserializeAs_GameRolePlayPrismInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.alignInfos = new ActorAlignmentInformations();
         this.alignInfos.deserialize(param1);
      }
   }
}
