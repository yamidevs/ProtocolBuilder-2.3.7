package com.ankamagames.dofus.network.messages.game.chat
{
   import com.ankamagames.dofus.network.types.game.data.items.ObjectItem;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ChatClientMultiWithObjectMessage extends ChatClientMultiMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 862;
       
      
      private var _isInitialized:Boolean = false;
      
      public var objects:Vector.<ObjectItem>;
      
      public function ChatClientMultiWithObjectMessage()
      {
         this.objects = new Vector.<ObjectItem>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 862;
      }
      
      public function initChatClientMultiWithObjectMessage(param1:String = "", param2:uint = 0, param3:Vector.<ObjectItem> = null) : ChatClientMultiWithObjectMessage
      {
         super.initChatClientMultiMessage(param1,param2);
         this.objects = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.objects = new Vector.<ObjectItem>();
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_ChatClientMultiWithObjectMessage(param1);
      }
      
      public function serializeAs_ChatClientMultiWithObjectMessage(param1:IDataOutput) : void
      {
         super.serializeAs_ChatClientMultiMessage(param1);
         param1.writeShort(this.objects.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.objects.length)
         {
            (this.objects[_loc2_] as ObjectItem).serializeAs_ObjectItem(param1);
            _loc2_++;
         }
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ChatClientMultiWithObjectMessage(param1);
      }
      
      public function deserializeAs_ChatClientMultiWithObjectMessage(param1:IDataInput) : void
      {
         var _loc4_:ObjectItem = null;
         super.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new ObjectItem();
            _loc4_.deserialize(param1);
            this.objects.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
