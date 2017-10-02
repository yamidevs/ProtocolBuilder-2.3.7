package com.ankamagames.dofus.network.messages.game.approach
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AuthenticationTicketWithClientPacksMessage extends AuthenticationTicketMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6190;
       
      
      private var _isInitialized:Boolean = false;
      
      public var packs:Vector.<uint>;
      
      public function AuthenticationTicketWithClientPacksMessage()
      {
         this.packs = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6190;
      }
      
      public function initAuthenticationTicketWithClientPacksMessage(param1:String = "", param2:String = "", param3:Vector.<uint> = null) : AuthenticationTicketWithClientPacksMessage
      {
         super.initAuthenticationTicketMessage(param1,param2);
         this.packs = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.packs = new Vector.<uint>();
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
         this.serializeAs_AuthenticationTicketWithClientPacksMessage(param1);
      }
      
      public function serializeAs_AuthenticationTicketWithClientPacksMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AuthenticationTicketMessage(param1);
         param1.writeShort(this.packs.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.packs.length)
         {
            if(this.packs[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.packs[_loc2_] + ") on element 1 (starting at 1) of packs.");
            }
            param1.writeInt(this.packs[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AuthenticationTicketWithClientPacksMessage(param1);
      }
      
      public function deserializeAs_AuthenticationTicketWithClientPacksMessage(param1:IDataInput) : void
      {
         var _loc4_:uint = 0;
         super.deserialize(param1);
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            if(_loc4_ < 0)
            {
               throw new Error("Forbidden value (" + _loc4_ + ") on elements of packs.");
            }
            this.packs.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
