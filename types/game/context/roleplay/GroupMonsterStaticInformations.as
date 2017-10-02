package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class GroupMonsterStaticInformations implements INetworkType
   {
      
      public static const protocolId:uint = 140;
       
      
      public var mainCreatureGenericId:int = 0;
      
      public var mainCreatureGrade:uint = 0;
      
      public var underlings:Vector.<MonsterInGroupInformations>;
      
      public function GroupMonsterStaticInformations()
      {
         this.underlings = new Vector.<MonsterInGroupInformations>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 140;
      }
      
      public function initGroupMonsterStaticInformations(param1:int = 0, param2:uint = 0, param3:Vector.<MonsterInGroupInformations> = null) : GroupMonsterStaticInformations
      {
         this.mainCreatureGenericId = param1;
         this.mainCreatureGrade = param2;
         this.underlings = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.mainCreatureGenericId = 0;
         this.mainCreatureGrade = 0;
         this.underlings = new Vector.<MonsterInGroupInformations>();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GroupMonsterStaticInformations(param1);
      }
      
      public function serializeAs_GroupMonsterStaticInformations(param1:IDataOutput) : void
      {
         param1.writeInt(this.mainCreatureGenericId);
         if(this.mainCreatureGrade < 0)
         {
            throw new Error("Forbidden value (" + this.mainCreatureGrade + ") on element mainCreatureGrade.");
         }
         param1.writeByte(this.mainCreatureGrade);
         param1.writeShort(this.underlings.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.underlings.length)
         {
            (this.underlings[_loc2_] as MonsterInGroupInformations).serializeAs_MonsterInGroupInformations(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GroupMonsterStaticInformations(param1);
      }
      
      public function deserializeAs_GroupMonsterStaticInformations(param1:IDataInput) : void
      {
         var _loc4_:MonsterInGroupInformations = null;
         this.mainCreatureGenericId = param1.readInt();
         this.mainCreatureGrade = param1.readByte();
         if(this.mainCreatureGrade < 0)
         {
            throw new Error("Forbidden value (" + this.mainCreatureGrade + ") on element of GroupMonsterStaticInformations.mainCreatureGrade.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new MonsterInGroupInformations();
            _loc4_.deserialize(param1);
            this.underlings.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
