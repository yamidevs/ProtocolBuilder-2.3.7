package com.ankamagames.dofus.network.types.game.actions.fight
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AbstractFightDispellableEffect implements INetworkType
   {
      
      public static const protocolId:uint = 206;
       
      
      public var uid:uint = 0;
      
      public var targetId:int = 0;
      
      public var turnDuration:int = 0;
      
      public var dispelable:uint = 1;
      
      public var spellId:uint = 0;
      
      public function AbstractFightDispellableEffect()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 206;
      }
      
      public function initAbstractFightDispellableEffect(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 1, param5:uint = 0) : AbstractFightDispellableEffect
      {
         this.uid = param1;
         this.targetId = param2;
         this.turnDuration = param3;
         this.dispelable = param4;
         this.spellId = param5;
         return this;
      }
      
      public function reset() : void
      {
         this.uid = 0;
         this.targetId = 0;
         this.turnDuration = 0;
         this.dispelable = 1;
         this.spellId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_AbstractFightDispellableEffect(param1);
      }
      
      public function serializeAs_AbstractFightDispellableEffect(param1:IDataOutput) : void
      {
         if(this.uid < 0)
         {
            throw new Error("Forbidden value (" + this.uid + ") on element uid.");
         }
         param1.writeInt(this.uid);
         param1.writeInt(this.targetId);
         param1.writeShort(this.turnDuration);
         param1.writeByte(this.dispelable);
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element spellId.");
         }
         param1.writeShort(this.spellId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AbstractFightDispellableEffect(param1);
      }
      
      public function deserializeAs_AbstractFightDispellableEffect(param1:IDataInput) : void
      {
         this.uid = param1.readInt();
         if(this.uid < 0)
         {
            throw new Error("Forbidden value (" + this.uid + ") on element of AbstractFightDispellableEffect.uid.");
         }
         this.targetId = param1.readInt();
         this.turnDuration = param1.readShort();
         this.dispelable = param1.readByte();
         if(this.dispelable < 0)
         {
            throw new Error("Forbidden value (" + this.dispelable + ") on element of AbstractFightDispellableEffect.dispelable.");
         }
         this.spellId = param1.readShort();
         if(this.spellId < 0)
         {
            throw new Error("Forbidden value (" + this.spellId + ") on element of AbstractFightDispellableEffect.spellId.");
         }
      }
   }
}
