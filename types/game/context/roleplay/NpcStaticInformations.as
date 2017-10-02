package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class NpcStaticInformations implements INetworkType
   {
      
      public static const protocolId:uint = 155;
       
      
      public var npcId:uint = 0;
      
      public var sex:Boolean = false;
      
      public var specialArtworkId:uint = 0;
      
      public function NpcStaticInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 155;
      }
      
      public function initNpcStaticInformations(param1:uint = 0, param2:Boolean = false, param3:uint = 0) : NpcStaticInformations
      {
         this.npcId = param1;
         this.sex = param2;
         this.specialArtworkId = param3;
         return this;
      }
      
      public function reset() : void
      {
         this.npcId = 0;
         this.sex = false;
         this.specialArtworkId = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_NpcStaticInformations(param1);
      }
      
      public function serializeAs_NpcStaticInformations(param1:IDataOutput) : void
      {
         if(this.npcId < 0)
         {
            throw new Error("Forbidden value (" + this.npcId + ") on element npcId.");
         }
         param1.writeShort(this.npcId);
         param1.writeBoolean(this.sex);
         if(this.specialArtworkId < 0)
         {
            throw new Error("Forbidden value (" + this.specialArtworkId + ") on element specialArtworkId.");
         }
         param1.writeShort(this.specialArtworkId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_NpcStaticInformations(param1);
      }
      
      public function deserializeAs_NpcStaticInformations(param1:IDataInput) : void
      {
         this.npcId = param1.readShort();
         if(this.npcId < 0)
         {
            throw new Error("Forbidden value (" + this.npcId + ") on element of NpcStaticInformations.npcId.");
         }
         this.sex = param1.readBoolean();
         this.specialArtworkId = param1.readShort();
         if(this.specialArtworkId < 0)
         {
            throw new Error("Forbidden value (" + this.specialArtworkId + ") on element of NpcStaticInformations.specialArtworkId.");
         }
      }
   }
}
