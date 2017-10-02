package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class OrientedObjectItemWithLookInRolePlay extends ObjectItemWithLookInRolePlay implements INetworkType
   {
      
      public static const protocolId:uint = 199;
       
      
      public var direction:uint = 1;
      
      public function OrientedObjectItemWithLookInRolePlay()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 199;
      }
      
      public function initOrientedObjectItemWithLookInRolePlay(param1:uint = 0, param2:uint = 0, param3:EntityLook = null, param4:uint = 1) : OrientedObjectItemWithLookInRolePlay
      {
         super.initObjectItemWithLookInRolePlay(param1,param2,param3);
         this.direction = param4;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.direction = 1;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_OrientedObjectItemWithLookInRolePlay(param1);
      }
      
      public function serializeAs_OrientedObjectItemWithLookInRolePlay(param1:IDataOutput) : void
      {
         super.serializeAs_ObjectItemWithLookInRolePlay(param1);
         param1.writeByte(this.direction);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_OrientedObjectItemWithLookInRolePlay(param1);
      }
      
      public function deserializeAs_OrientedObjectItemWithLookInRolePlay(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.direction = param1.readByte();
         if(this.direction < 0)
         {
            throw new Error("Forbidden value (" + this.direction + ") on element of OrientedObjectItemWithLookInRolePlay.direction.");
         }
      }
   }
}
