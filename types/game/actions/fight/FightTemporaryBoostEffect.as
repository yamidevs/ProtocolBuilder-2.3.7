package com.ankamagames.dofus.network.types.game.actions.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class FightTemporaryBoostEffect extends AbstractFightDispellableEffect implements INetworkType
   {
      
      public static const protocolId:uint = 209;
       
      
      public var delta:int = 0;
      
      public function FightTemporaryBoostEffect()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 209;
      }
      
      public function initFightTemporaryBoostEffect(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 1, param5:uint = 0, param6:int = 0) : FightTemporaryBoostEffect
      {
         super.initAbstractFightDispellableEffect(param1,param2,param3,param4,param5);
         this.delta = param6;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.delta = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FightTemporaryBoostEffect(param1);
      }
      
      public function serializeAs_FightTemporaryBoostEffect(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractFightDispellableEffect(param1);
         param1.writeShort(this.delta);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FightTemporaryBoostEffect(param1);
      }
      
      public function deserializeAs_FightTemporaryBoostEffect(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.delta = param1.readShort();
      }
   }
}
