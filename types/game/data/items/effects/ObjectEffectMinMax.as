package com.ankamagames.dofus.network.types.game.data.items.effects
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectEffectMinMax extends ObjectEffect implements INetworkType
   {
      
      public static const protocolId:uint = 82;
       
      
      public var min:uint = 0;
      
      public var max:uint = 0;
      
      public function ObjectEffectMinMax()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 82;
      }
      
      public function initObjectEffectMinMax(param1:uint = 0, param2:uint = 0, param3:uint = 0) : ObjectEffectMinMax
      {
         super.initObjectEffect(param1);
         this.min = param2;
         this.max = param3;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.min = 0;
         this.max = 0;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectEffectMinMax(param1);
      }
      
      public function serializeAs_ObjectEffectMinMax(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectEffect(param1);
         if(this.min < 0)
         {
            throw new Error("Forbidden value (" + this.min + ") on element min.");
         }
         param1.writeShort(this.min);
         if(this.max < 0)
         {
            throw new Error("Forbidden value (" + this.max + ") on element max.");
         }
         param1.writeShort(this.max);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectEffectMinMax(param1);
      }
      
      public function deserializeAs_ObjectEffectMinMax(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.min = param1.readShort();
         if(this.min < 0)
         {
            throw new Error("Forbidden value (" + this.min + ") on element of ObjectEffectMinMax.min.");
         }
         this.max = param1.readShort();
         if(this.max < 0)
         {
            throw new Error("Forbidden value (" + this.max + ") on element of ObjectEffectMinMax.max.");
         }
      }
   }
}
