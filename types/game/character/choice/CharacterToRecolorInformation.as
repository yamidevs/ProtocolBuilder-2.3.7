package com.ankamagames.dofus.network.types.game.character.choice
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CharacterToRecolorInformation implements INetworkType
   {
      
      public static const protocolId:uint = 212;
       
      
      public var id:uint = 0;
      
      public var colors:Vector.<int>;
      
      public function CharacterToRecolorInformation()
      {
         this.colors = new Vector.<int>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 212;
      }
      
      public function initCharacterToRecolorInformation(param1:uint = 0, param2:Vector.<int> = null) : CharacterToRecolorInformation
      {
         this.id = param1;
         this.colors = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.id = 0;
         this.colors = new Vector.<int>();
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_CharacterToRecolorInformation(param1);
      }
      
      public function serializeAs_CharacterToRecolorInformation(param1:IDataOutput) : void
      {
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeInt(this.id);
         param1.writeShort(this.colors.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.colors.length)
         {
            param1.writeInt(this.colors[_loc2_]);
            _loc2_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterToRecolorInformation(param1);
      }
      
      public function deserializeAs_CharacterToRecolorInformation(param1:IDataInput) : void
      {
         var _loc4_:int = 0;
         this.id = param1.readInt();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of CharacterToRecolorInformation.id.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInt();
            this.colors.push(_loc4_);
            _loc3_++;
         }
      }
   }
}
