package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.BasicGuildInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FriendSpouseOnlineInformations extends FriendSpouseInformations implements INetworkType
   {
      
      public static const protocolId:uint = 93;
       
      
      public var mapId:uint = 0;
      
      public var subAreaId:uint = 0;
      
      public var inFight:Boolean = false;
      
      public var followSpouse:Boolean = false;
      
      public var pvpEnabled:Boolean = false;
      
      public function FriendSpouseOnlineInformations()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 93;
      }
      
      public function initFriendSpouseOnlineInformations(param1:uint = 0, param2:String = "", param3:uint = 0, param4:int = 0, param5:int = 0, param6:EntityLook = null, param7:BasicGuildInformations = null, param8:int = 0, param9:uint = 0, param10:uint = 0, param11:Boolean = false, param12:Boolean = false, param13:Boolean = false) : FriendSpouseOnlineInformations
      {
         super.initFriendSpouseInformations(param1,param2,param3,param4,param5,param6,param7,param8);
         this.mapId = param9;
         this.subAreaId = param10;
         this.inFight = param11;
         this.followSpouse = param12;
         this.pvpEnabled = param13;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.mapId = 0;
         this.subAreaId = 0;
         this.inFight = false;
         this.followSpouse = false;
         this.pvpEnabled = false;
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_FriendSpouseOnlineInformations(param1);
      }
      
      public function serializeAs_FriendSpouseOnlineInformations(param1:IDataOutput) : void
      {
         super.serializeAs_FriendSpouseInformations(param1);
         var _loc2_:uint = 0;
         BooleanByteWrapper.setFlag(_loc2_,0,this.inFight);
         BooleanByteWrapper.setFlag(_loc2_,1,this.followSpouse);
         BooleanByteWrapper.setFlag(_loc2_,2,this.pvpEnabled);
         param1.writeByte(_loc2_);
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element mapId.");
         }
         param1.writeInt(this.mapId);
         if(this.subAreaId < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaId + ") on element subAreaId.");
         }
         param1.writeShort(this.subAreaId);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_FriendSpouseOnlineInformations(param1);
      }
      
      public function deserializeAs_FriendSpouseOnlineInformations(param1:IDataInput) : void
      {
         super.deserialize(param1);
         var _loc2_:uint = param1.readByte();
         this.inFight = BooleanByteWrapper.getFlag(_loc2_,0);
         this.followSpouse = BooleanByteWrapper.getFlag(_loc2_,1);
         this.pvpEnabled = BooleanByteWrapper.getFlag(_loc2_,2);
         this.mapId = param1.readInt();
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element of FriendSpouseOnlineInformations.mapId.");
         }
         this.subAreaId = param1.readShort();
         if(this.subAreaId < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaId + ") on element of FriendSpouseOnlineInformations.subAreaId.");
         }
      }
   }
}
