package com.ankamagames.dofus.network.messages.game.achievement
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.achievement.Achievement;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AchievementListMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6205;
       
      
      private var _isInitialized:Boolean = false;
      
      public var startedAchievements:Vector.<Achievement>;
      
      public var finishedAchievementsIds:Vector.<uint>;
      
      public function AchievementListMessage()
      {
         this.startedAchievements = new Vector.<Achievement>();
         this.finishedAchievementsIds = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6205;
      }
      
      public function initAchievementListMessage(param1:Vector.<Achievement> = null, param2:Vector.<uint> = null) : AchievementListMessage
      {
         this.startedAchievements = param1;
         this.finishedAchievementsIds = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.startedAchievements = new Vector.<Achievement>();
         this.finishedAchievementsIds = new Vector.<uint>();
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_AchievementListMessage(param1);
      }
      
      public function serializeAs_AchievementListMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.startedAchievements.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.startedAchievements.length)
         {
            param1.writeShort((this.startedAchievements[_loc2_] as Achievement).getTypeId());
            (this.startedAchievements[_loc2_] as Achievement).serialize(param1);
            _loc2_++;
         }
         param1.writeShort(this.finishedAchievementsIds.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.finishedAchievementsIds.length)
         {
            if(this.finishedAchievementsIds[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.finishedAchievementsIds[_loc3_] + ") on element 2 (starting at 1) of finishedAchievementsIds.");
            }
            param1.writeShort(this.finishedAchievementsIds[_loc3_]);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AchievementListMessage(param1);
      }
      
      public function deserializeAs_AchievementListMessage(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:Achievement = null;
         var _loc8_:uint = 0;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readUnsignedShort();
            _loc7_ = ProtocolTypeManager.getInstance(Achievement,_loc6_);
            _loc7_.deserialize(param1);
            this.startedAchievements.push(_loc7_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = param1.readShort();
            if(_loc8_ < 0)
            {
               throw new Error("Forbidden value (" + _loc8_ + ") on elements of finishedAchievementsIds.");
            }
            this.finishedAchievementsIds.push(_loc8_);
            _loc5_++;
         }
      }
   }
}
