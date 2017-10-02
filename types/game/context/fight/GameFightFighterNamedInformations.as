package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GameFightFighterNamedInformations extends GameFightFighterInformations implements INetworkType
   {
      
      public static const protocolId:uint = 158;
       
      
      public var name:String = "";
      
      public function GameFightFighterNamedInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 158;
      }
      
      public function initGameFightFighterNamedInformations(param1:int = 0, param2:EntityLook = null, param3:EntityDispositionInformations = null, param4:uint = 2, param5:Boolean = false, param6:GameFightMinimalStats = null, param7:String = "") : GameFightFighterNamedInformations
      {
         super.initGameFightFighterInformations(param1,param2,param3,param4,param5,param6);
         this.name = param7;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.name = "";
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameFightFighterNamedInformations(param1);
      }
      
      public function serializeAs_GameFightFighterNamedInformations(param1:IDataOutput) : void
      {
         super.serializeAs_GameFightFighterInformations(param1);
         param1.writeUTF(this.name);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameFightFighterNamedInformations(param1);
      }
      
      public function deserializeAs_GameFightFighterNamedInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.name = param1.readUTF();
      }
   }
}
