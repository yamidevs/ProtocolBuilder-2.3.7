package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildMemberWarnOnConnectionStateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6160;
       
      
      private var _isInitialized:Boolean = false;
      
      public var enable:Boolean = false;
      
      public function GuildMemberWarnOnConnectionStateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6160;
      }
      
      public function initGuildMemberWarnOnConnectionStateMessage(param1:Boolean = false) : GuildMemberWarnOnConnectionStateMessage
      {
         this.enable = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.enable = false;
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
         this.serializeAs_GuildMemberWarnOnConnectionStateMessage(param1);
      }
      
      public function serializeAs_GuildMemberWarnOnConnectionStateMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.enable);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildMemberWarnOnConnectionStateMessage(param1);
      }
      
      public function deserializeAs_GuildMemberWarnOnConnectionStateMessage(param1:IDataInput) : void
      {
         this.enable = param1.readBoolean();
      }
   }
}
