package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.BasicGuildInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FriendSpouseInformations implements INetworkType
   {
      
      public static const protocolId:uint = 77;
       
      
      public var spouseId:uint = 0;
      
      public var spouseName:String = "";
      
      public var spouseLevel:uint = 0;
      
      public var breed:int = 0;
      
      public var sex:int = 0;
      
      public var spouseEntityLook:EntityLook;
      
      public var guildInfo:BasicGuildInformations;
      
      public var alignmentSide:int = 0;
      
      public function FriendSpouseInformations()
      {
         this.spouseEntityLook = new EntityLook();
         this.guildInfo = new BasicGuildInformations();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 77;
      }
      
      public function initFriendSpouseInformations(param1:uint = 0, param2:String = "", param3:uint = 0, param4:int = 0, param5:int = 0, param6:EntityLook = null, param7:BasicGuildInformations = null, param8:int = 0) : FriendSpouseInformations
      {
         this.spouseId = param1;
         this.spouseName = param2;
         this.spouseLevel = param3;
         this.breed = param4;
         this.sex = param5;
         this.spouseEntityLook = param6;
         this.guildInfo = param7;
         this.alignmentSide = param8;
         return this;
      }
      
      public function reset() : void
      {
         this.spouseId = 0;
         this.spouseName = "";
         this.spouseLevel = 0;
         this.breed = 0;
         this.sex = 0;
         this.spouseEntityLook = new EntityLook();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FriendSpouseInformations(param1);
      }
      
      public function serializeAs_FriendSpouseInformations(param1:IDataOutput) : void
      {
         if(this.spouseId < 0)
         {
            throw new Error("Forbidden value (" + this.spouseId + ") on element spouseId.");
         }
         param1.writeInt(this.spouseId);
         param1.writeUTF(this.spouseName);
         if(this.spouseLevel < 1 || this.spouseLevel > 200)
         {
            throw new Error("Forbidden value (" + this.spouseLevel + ") on element spouseLevel.");
         }
         param1.writeByte(this.spouseLevel);
         param1.writeByte(this.breed);
         param1.writeByte(this.sex);
         this.spouseEntityLook.serializeAs_EntityLook(param1);
         this.guildInfo.serializeAs_BasicGuildInformations(param1);
         param1.writeByte(this.alignmentSide);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendSpouseInformations(param1);
      }
      
      public function deserializeAs_FriendSpouseInformations(param1:IDataInput) : void
      {
         this.spouseId = param1.readInt();
         if(this.spouseId < 0)
         {
            throw new Error("Forbidden value (" + this.spouseId + ") on element of FriendSpouseInformations.spouseId.");
         }
         this.spouseName = param1.readUTF();
         this.spouseLevel = param1.readUnsignedByte();
         if(this.spouseLevel < 1 || this.spouseLevel > 200)
         {
            throw new Error("Forbidden value (" + this.spouseLevel + ") on element of FriendSpouseInformations.spouseLevel.");
         }
         this.breed = param1.readByte();
         this.sex = param1.readByte();
         this.spouseEntityLook = new EntityLook();
         this.spouseEntityLook.deserialize(param1);
         this.guildInfo = new BasicGuildInformations();
         this.guildInfo.deserialize(param1);
         this.alignmentSide = param1.readByte();
      }
   }
}
