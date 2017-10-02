package com.ankamagames.dofus.network.messages.game.shortcut
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ShortcutBarRemovedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6224;
       
      
      private var _isInitialized:Boolean = false;
      
      public var barType:uint = 0;
      
      public var slot:uint = 0;
      
      public function ShortcutBarRemovedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6224;
      }
      
      public function initShortcutBarRemovedMessage(param1:uint = 0, param2:uint = 0) : ShortcutBarRemovedMessage
      {
         this.barType = param1;
         this.slot = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.barType = 0;
         this.slot = 0;
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
         this.serializeAs_ShortcutBarRemovedMessage(param1);
      }
      
      public function serializeAs_ShortcutBarRemovedMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.barType);
         if(this.slot < 0 || this.slot > 99)
         {
            throw new Error("Forbidden value (" + this.slot + ") on element slot.");
         }
         param1.writeInt(this.slot);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ShortcutBarRemovedMessage(param1);
      }
      
      public function deserializeAs_ShortcutBarRemovedMessage(param1:IDataInput) : void
      {
         this.barType = param1.readByte();
         if(this.barType < 0)
         {
            throw new Error("Forbidden value (" + this.barType + ") on element of ShortcutBarRemovedMessage.barType.");
         }
         this.slot = param1.readInt();
         if(this.slot < 0 || this.slot > 99)
         {
            throw new Error("Forbidden value (" + this.slot + ") on element of ShortcutBarRemovedMessage.slot.");
         }
      }
   }
}
