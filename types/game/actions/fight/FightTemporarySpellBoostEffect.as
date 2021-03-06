package com.ankamagames.dofus.network.types.game.actions.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class FightTemporarySpellBoostEffect extends FightTemporaryBoostEffect implements INetworkType
   {
      
      public static const protocolId:uint = 207;
       
      
      public var boostedSpellId:uint = 0;
      
      public function FightTemporarySpellBoostEffect()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 207;
      }
      
      public function initFightTemporarySpellBoostEffect(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 1, param5:uint = 0, param6:int = 0, param7:uint = 0) : FightTemporarySpellBoostEffect
      {
         super.initFightTemporaryBoostEffect(param1,param2,param3,param4,param5,param6);
         this.boostedSpellId = param7;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.boostedSpellId = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FightTemporarySpellBoostEffect(param1);
      }
      
      public function serializeAs_FightTemporarySpellBoostEffect(param1:IDataOutput) : void
      {
         super.serializeAs_FightTemporaryBoostEffect(param1);
         if(this.boostedSpellId < 0)
         {
            throw new Error("Forbidden value (" + this.boostedSpellId + ") on element boostedSpellId.");
         }
         param1.writeShort(this.boostedSpellId);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FightTemporarySpellBoostEffect(param1);
      }
      
      public function deserializeAs_FightTemporarySpellBoostEffect(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.boostedSpellId = param1.readShort();
         if(this.boostedSpellId < 0)
         {
            throw new Error("Forbidden value (" + this.boostedSpellId + ") on element of FightTemporarySpellBoostEffect.boostedSpellId.");
         }
      }
   }
}
