package com.ankamagames.dofus.network.types.game.context.roleplay
{
   import com.ankamagames.dofus.network.types.game.character.restriction.ActorRestrictionsInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class HumanInformations implements INetworkType
   {
      
      public static const protocolId:uint = 157;
       
      
      public var followingCharactersLook:Vector.<EntityLook>;
      
      public var emoteId:int = 0;
      
      public var emoteEndTime:uint = 0;
      
      public var restrictions:ActorRestrictionsInformations;
      
      public var titleId:uint = 0;
      
      public var titleParam:String = "";
      
      public function HumanInformations()
      {
         this.followingCharactersLook = new Vector.<EntityLook>();
         this.restrictions = new ActorRestrictionsInformations();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 157;
      }
      
      public function initHumanInformations(param1:Vector.<EntityLook> = null, param2:int = 0, param3:uint = 0, param4:ActorRestrictionsInformations = null, param5:uint = 0, param6:String = "") : HumanInformations
      {
         this.followingCharactersLook = param1;
         this.emoteId = param2;
         this.emoteEndTime = param3;
         this.restrictions = param4;
         this.titleId = param5;
         this.titleParam = param6;
         return this;
      }
      
      public function reset() : void
      {
         this.followingCharactersLook = new Vector.<EntityLook>();
         this.emoteId = 0;
         this.emoteEndTime = 0;
         this.restrictions = new ActorRestrictionsInformations();
         this.titleParam = "";
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_HumanInformations(param1);
      }
      
      public function serializeAs_HumanInformations(param1:IDataOutput) : void
      {
         param1.writeShort(this.followingCharactersLook.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.followingCharactersLook.length)
         {
            (this.followingCharactersLook[_loc2_] as EntityLook).serializeAs_EntityLook(param1);
            _loc2_++;
         }
         param1.writeByte(this.emoteId);
         if(this.emoteEndTime < 0 || this.emoteEndTime > 65535)
         {
            throw new Error("Forbidden value (" + this.emoteEndTime + ") on element emoteEndTime.");
         }
         param1.writeShort(this.emoteEndTime);
         this.restrictions.serializeAs_ActorRestrictionsInformations(param1);
         if(this.titleId < 0)
         {
            throw new Error("Forbidden value (" + this.titleId + ") on element titleId.");
         }
         param1.writeShort(this.titleId);
         param1.writeUTF(this.titleParam);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HumanInformations(param1);
      }
      
      public function deserializeAs_HumanInformations(param1:IDataInput) : void
      {
         var _loc4_:EntityLook = null;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new EntityLook();
            _loc4_.deserialize(param1);
            this.followingCharactersLook.push(_loc4_);
            _loc3_++;
         }
         this.emoteId = param1.readByte();
         this.emoteEndTime = param1.readUnsignedShort();
         if(this.emoteEndTime < 0 || this.emoteEndTime > 65535)
         {
            throw new Error("Forbidden value (" + this.emoteEndTime + ") on element of HumanInformations.emoteEndTime.");
         }
         this.restrictions = new ActorRestrictionsInformations();
         this.restrictions.deserialize(param1);
         this.titleId = param1.readShort();
         if(this.titleId < 0)
         {
            throw new Error("Forbidden value (" + this.titleId + ") on element of HumanInformations.titleId.");
         }
         this.titleParam = param1.readUTF();
      }
   }
}
