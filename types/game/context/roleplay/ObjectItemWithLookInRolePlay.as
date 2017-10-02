package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectItemWithLookInRolePlay extends ObjectItemInRolePlay implements INetworkType
   {
      
      public static const protocolId:uint = 197;
       
      
      public var entityLook:EntityLook;
      
      public function ObjectItemWithLookInRolePlay()
      {
         this.entityLook = new EntityLook();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 197;
      }
      
      public function initObjectItemWithLookInRolePlay(param1:uint = 0, param2:uint = 0, param3:EntityLook = null) : ObjectItemWithLookInRolePlay
      {
         super.initObjectItemInRolePlay(param1,param2);
         this.entityLook = param3;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.entityLook = new EntityLook();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ObjectItemWithLookInRolePlay(param1);
      }
      
      public function serializeAs_ObjectItemWithLookInRolePlay(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectItemInRolePlay(param1);
         this.entityLook.serializeAs_EntityLook(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectItemWithLookInRolePlay(param1);
      }
      
      public function deserializeAs_ObjectItemWithLookInRolePlay(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.entityLook = new EntityLook();
         this.entityLook.deserialize(param1);
      }
   }
}
