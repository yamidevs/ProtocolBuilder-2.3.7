package com.ankamagames.dofus.network.types.game.data.items.effects
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectEffectString extends ObjectEffect implements INetworkType
   {
      
      public static const protocolId:uint = 74;
       
      
      public var value:String = "";
      
      public function ObjectEffectString()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 74;
      }
      
      public function initObjectEffectString(param1:uint = 0, param2:String = "") : ObjectEffectString
      {
         super.initObjectEffect(param1);
         this.value = param2;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.value = "";
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectEffectString(param1);
      }
      
      public function serializeAs_ObjectEffectString(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectEffect(param1);
         param1.writeUTF(this.value);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectEffectString(param1);
      }
      
      public function deserializeAs_ObjectEffectString(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.value = param1.readUTF();
      }
   }
}
