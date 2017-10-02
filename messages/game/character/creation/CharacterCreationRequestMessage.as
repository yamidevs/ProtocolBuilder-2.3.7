package com.ankamagames.dofus.network.messages.game.character.creation
{
   import com.ankamagames.dofus.network.enums.BreedEnum;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterCreationRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 160;
       
      
      private var _isInitialized:Boolean = false;
      
      public var name:String = "";
      
      public var breed:int = 0;
      
      public var sex:Boolean = false;
      
      public var colors:Vector.<int>;
      
      public function CharacterCreationRequestMessage()
      {
         this.colors = new Vector.<int>(6,true);
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 160;
      }
      
      public function initCharacterCreationRequestMessage(param1:String = "", param2:int = 0, param3:Boolean = false, param4:Vector.<int> = null) : CharacterCreationRequestMessage
      {
         this.name = param1;
         this.breed = param2;
         this.sex = param3;
         this.colors = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.name = "";
         this.breed = 0;
         this.sex = false;
         this.colors = new Vector.<int>(6,true);
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
         this.serializeAs_CharacterCreationRequestMessage(param1);
      }
      
      public function serializeAs_CharacterCreationRequestMessage(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name);
         param1.writeByte(this.breed);
         param1.writeBoolean(this.sex);
         var _loc2_:uint = 0;
         while(_loc2_ < 6)
         {
            param1.writeInt(this.colors[_loc2_]);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterCreationRequestMessage(param1);
      }
      
      public function deserializeAs_CharacterCreationRequestMessage(param1:IDataInput) : void
      {
         this.name = param1.readUTF();
         this.breed = param1.readByte();
         if(this.breed < BreedEnum.Feca || this.breed > BreedEnum.Zobal)
         {
            throw new Error("Forbidden value (" + this.breed + ") on element of CharacterCreationRequestMessage.breed.");
         }
         this.sex = param1.readBoolean();
         var _loc2_:uint = 0;
         while(_loc2_ < 6)
         {
            this.colors[_loc2_] = param1.readInt();
            _loc2_++;
         }
      }
   }
}
