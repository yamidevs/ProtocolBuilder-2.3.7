package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ObjectEffects implements INetworkType
   {
      
      public static const protocolId:uint = 358;
       
      
      public var powerRate:int = 0;
      
      public var overMax:Boolean = false;
      
      public var effects:Vector.<ObjectEffect>;
      
      public function ObjectEffects()
      {
         this.effects = new Vector.<ObjectEffect>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 358;
      }
      
      public function initObjectEffects(param1:int = 0, param2:Boolean = false, param3:Vector.<ObjectEffect> = null) : ObjectEffects
      {
         this.powerRate = param1;
         this.overMax = param2;
         this.effects = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.powerRate = 0;
         this.overMax = false;
         this.effects = new Vector.<ObjectEffect>();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectEffects(param1);
      }
      
      public function serializeAs_ObjectEffects(param1:IDataOutput) : void
      {
         param1.writeShort(this.powerRate);
         param1.writeBoolean(this.overMax);
         param1.writeShort(this.effects.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.effects.length)
         {
            param1.writeShort((this.effects[_loc2_] as ObjectEffect).getTypeId());
            (this.effects[_loc2_] as ObjectEffect).serialize(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectEffects(param1);
      }
      
      public function deserializeAs_ObjectEffects(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:ObjectEffect = null;
         this.powerRate = param1.readShort();
         this.overMax = param1.readBoolean();
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readUnsignedShort();
            _loc5_ = ProtocolTypeManager.getInstance(ObjectEffect,_loc4_);
            _loc5_.deserialize(param1);
            this.effects.push(_loc5_);
            _loc3_++;
         }
      }
   }
}
