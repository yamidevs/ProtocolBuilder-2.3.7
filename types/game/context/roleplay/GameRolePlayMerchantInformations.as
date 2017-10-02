package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameRolePlayMerchantInformations extends GameRolePlayNamedActorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 129;
       
      
      public var sellType:uint = 0;
      
      public function GameRolePlayMerchantInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 129;
      }
      
      public function initGameRolePlayMerchantInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:String = "", param5:uint = 0) : GameRolePlayMerchantInformations
      {
         super.initGameRolePlayNamedActorInformations(param1,param2,param3,param4);
         this.sellType = param5;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.sellType = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameRolePlayMerchantInformations(param1);
      }
      
      public function serializeAs_GameRolePlayMerchantInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameRolePlayNamedActorInformations(param1);
         if(this.sellType < 0)
         {
            throw new Error("Forbidden value (" + this.sellType + ") on element sellType.");
         }
         param1.writeInt(this.sellType);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameRolePlayMerchantInformations(param1);
      }
      
      public function deserializeAs_GameRolePlayMerchantInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.sellType = param1.readInt();
         if(this.sellType < 0)
         {
            throw new Error("Forbidden value (" + this.sellType + ") on element of GameRolePlayMerchantInformations.sellType.");
         }
      }
   }
}
