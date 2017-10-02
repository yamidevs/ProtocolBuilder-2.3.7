package com.ankamagames.dofus.network.messages.game.achievement
{
   import com.ankamagames.dofus.network.types.game.achievement.Achievement;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AchievementUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6207;
       
      
      private var _isInitialized:Boolean = false;
      
      public var achievement:Achievement;
      
      public function AchievementUpdateMessage()
      {
         this.achievement = new Achievement();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6207;
      }
      
      public function initAchievementUpdateMessage(param1:Achievement = null) : AchievementUpdateMessage
      {
         this.achievement = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.achievement = new Achievement();
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
         this.serializeAs_AchievementUpdateMessage(param1);
      }
      
      public function serializeAs_AchievementUpdateMessage(param1:IDataOutput) : void
      {
         this.achievement.serializeAs_Achievement(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AchievementUpdateMessage(param1);
      }
      
      public function deserializeAs_AchievementUpdateMessage(param1:IDataInput) : void
      {
         this.achievement = new Achievement();
         this.achievement.deserialize(param1);
      }
   }
}
