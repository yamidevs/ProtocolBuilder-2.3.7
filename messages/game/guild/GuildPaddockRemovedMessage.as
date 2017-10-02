package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildPaddockRemovedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5955;
       
      
      private var _isInitialized:Boolean = false;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public function GuildPaddockRemovedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5955;
      }
      
      public function initGuildPaddockRemovedMessage(param1:int = 0, param2:int = 0) : GuildPaddockRemovedMessage
      {
         this.worldX = param1;
         this.worldY = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.worldX = 0;
         this.worldY = 0;
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
         this.serializeAs_GuildPaddockRemovedMessage(param1);
      }
      
      public function serializeAs_GuildPaddockRemovedMessage(param1:IDataOutput) : void
      {
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element worldX.");
         }
         param1.writeShort(this.worldX);
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element worldY.");
         }
         param1.writeShort(this.worldY);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildPaddockRemovedMessage(param1);
      }
      
      public function deserializeAs_GuildPaddockRemovedMessage(param1:IDataInput) : void
      {
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of GuildPaddockRemovedMessage.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of GuildPaddockRemovedMessage.worldY.");
         }
      }
   }
}
