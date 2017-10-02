package com.ankamagames.dofus.network.types.game.character
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class CharacterMinimalInformations implements INetworkType
   {
      
      public static const protocolId:uint = 110;
       
      
      public var id:uint = 0;
      
      public var level:uint = 0;
      
      public var name:String = "";
      
      public function CharacterMinimalInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 110;
      }
      
      public function initCharacterMinimalInformations(param1:uint = 0, param2:uint = 0, param3:String = "") : CharacterMinimalInformations
      {
         this.id = param1;
         this.level = param2;
         this.name = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.id = 0;
         this.level = 0;
         this.name = "";
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_CharacterMinimalInformations(param1);
      }
      
      public function serializeAs_CharacterMinimalInformations(param1:IDataOutput) : void
      {
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeInt(this.id);
         if(this.level < 1 || this.level > 200)
         {
            throw new Error("Forbidden value (" + this.level + ") on element level.");
         }
         param1.writeByte(this.level);
         param1.writeUTF(this.name);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CharacterMinimalInformations(param1);
      }
      
      public function deserializeAs_CharacterMinimalInformations(param1:IDataInput) : void
      {
         this.id = param1.readInt();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of CharacterMinimalInformations.id.");
         }
         this.level = param1.readUnsignedByte();
         if(this.level < 1 || this.level > 200)
         {
            throw new Error("Forbidden value (" + this.level + ") on element of CharacterMinimalInformations.level.");
         }
         this.name = param1.readUTF();
      }
   }
}
