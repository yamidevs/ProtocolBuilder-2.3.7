package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ObjectItemToSellInNpcShop extends ObjectItemMinimalInformation implements INetworkType
   {
      
      public static const protocolId:uint = 352;
       
      
      public var objectPrice:uint = 0;
      
      public var buyCriterion:String = "";
      
      public function ObjectItemToSellInNpcShop()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 352;
      }
      
      public function initObjectItemToSellInNpcShop(param1:uint = 0, param2:int = 0, param3:Boolean = false, param4:Vector.<ObjectEffect> = null, param5:uint = 0, param6:String = "") : ObjectItemToSellInNpcShop
      {
         super.initObjectItemMinimalInformation(param1,param2,param3,param4);
         this.objectPrice = param5;
         this.buyCriterion = param6;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.objectPrice = 0;
         this.buyCriterion = "";
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectItemToSellInNpcShop(param1);
      }
      
      public function serializeAs_ObjectItemToSellInNpcShop(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectItemMinimalInformation(param1);
         if(this.objectPrice < 0)
         {
            throw new Error("Forbidden value (" + this.objectPrice + ") on element objectPrice.");
         }
         param1.writeInt(this.objectPrice);
         param1.writeUTF(this.buyCriterion);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectItemToSellInNpcShop(param1);
      }
      
      public function deserializeAs_ObjectItemToSellInNpcShop(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.objectPrice = param1.readInt();
         if(this.objectPrice < 0)
         {
            throw new Error("Forbidden value (" + this.objectPrice + ") on element of ObjectItemToSellInNpcShop.objectPrice.");
         }
         this.buyCriterion = param1.readUTF();
      }
   }
}
