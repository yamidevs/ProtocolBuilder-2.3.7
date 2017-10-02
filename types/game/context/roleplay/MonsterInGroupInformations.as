package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class MonsterInGroupInformations implements INetworkType
   {
      
      public static const protocolId:uint = 144;
       
      
      public var creatureGenericId:int = 0;
      
      public var grade:uint = 0;
      
      public var look:EntityLook;
      
      public function MonsterInGroupInformations()
      {
         this.look = new EntityLook();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 144;
      }
      
      public function initMonsterInGroupInformations(param1:int = 0, param2:uint = 0, param3:EntityLook = null) : MonsterInGroupInformations
      {
         this.creatureGenericId = param1;
         this.grade = param2;
         this.look = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.creatureGenericId = 0;
         this.grade = 0;
         this.look = new EntityLook();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_MonsterInGroupInformations(param1);
      }
      
      public function serializeAs_MonsterInGroupInformations(param1:IDataOutput) : void
      {
         param1.writeInt(this.creatureGenericId);
         if(this.grade < 0)
         {
            throw new Error("Forbidden value (" + this.grade + ") on element grade.");
         }
         param1.writeByte(this.grade);
         this.look.serializeAs_EntityLook(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_MonsterInGroupInformations(param1);
      }
      
      public function deserializeAs_MonsterInGroupInformations(param1:IDataInput) : void
      {
         this.creatureGenericId = param1.readInt();
         this.grade = param1.readByte();
         if(this.grade < 0)
         {
            throw new Error("Forbidden value (" + this.grade + ") on element of MonsterInGroupInformations.grade.");
         }
         this.look = new EntityLook();
         this.look.deserialize(param1);
      }
   }
}
