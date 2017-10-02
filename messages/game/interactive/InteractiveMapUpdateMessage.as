package com.ankamagames.dofus.network.messages.game.interactive
{
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class InteractiveMapUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5002;
       
      
      private var _isInitialized:Boolean = false;
      
      public var interactiveElements:Vector.<InteractiveElement>;
      
      public function InteractiveMapUpdateMessage()
      {
         this.interactiveElements = new Vector.<InteractiveElement>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5002;
      }
      
      public function initInteractiveMapUpdateMessage(param1:Vector.<InteractiveElement> = null) : InteractiveMapUpdateMessage
      {
         this.interactiveElements = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.interactiveElements = new Vector.<InteractiveElement>();
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
         this.serializeAs_InteractiveMapUpdateMessage(param1);
      }
      
      public function serializeAs_InteractiveMapUpdateMessage(param1:IDataOutput) : void
      {
         param1.writeShort(this.interactiveElements.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.interactiveElements.length)
         {
            (this.interactiveElements[_loc2_] as InteractiveElement).serializeAs_InteractiveElement(param1);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_InteractiveMapUpdateMessage(param1);
      }
      
      public function deserializeAs_InteractiveMapUpdateMessage(param1:IDataInput) : void
      {
         var _loc4_:InteractiveElement = null;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new InteractiveElement();
            _loc4_.deserialize(param1);
            this.interactiveElements.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
