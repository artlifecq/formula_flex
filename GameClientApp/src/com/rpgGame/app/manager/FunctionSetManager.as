package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.friend.FriendManager;

    public class FunctionSetManager 
    {
        private static var _openAddFriend:Boolean;
        private static var _openAcceptTeam:Boolean;
        private static var _openAcceptFamily:Boolean;
        private static var _showFamilyTitle:Boolean;
        private static var _showGuildTitle:Boolean;
        private static var _showRoleTitle:Boolean;

        public static function defaultSetting():void
        {
            _openAddFriend = !(FriendManager.forbidBeenAddedAsFriend);
            showFamilyTitle = true;
            showGuildTitle = true;
            showRoleTitle = true;
        }

        public static function applySetting(functionSet:Object):void
        {
            if (functionSet != null)
            {
                showFamilyTitle = functionSet.showFamilyTitle;
                showGuildTitle = functionSet.showGuildTitle;
                showRoleTitle = functionSet.showRoleTitle;
            }
        }

        public static function get openAcceptFamily():Boolean
        {
            return _openAcceptFamily;
        }

        public static function set openAcceptFamily(value:Boolean):void
        {
            _openAcceptFamily = value;
        }

        public static function get openAcceptTeam():Boolean
        {
            return _openAcceptTeam;
        }

        public static function set openAcceptTeam(value:Boolean):void
        {
            _openAcceptTeam = value;
        }

        public static function get openAddFriend():Boolean
        {
            return _openAddFriend;
        }

        public static function set openAddFriend(value:Boolean):void
        {
            _openAddFriend = value;
        }

        public static function get showFamilyTitle():Boolean
        {
            return _showFamilyTitle;
        }

        public static function set showFamilyTitle(value:Boolean):void
        {
            _showFamilyTitle = value;
        }

        public static function get showGuildTitle():Boolean
        {
            return _showGuildTitle;
        }

        public static function set showGuildTitle(value:Boolean):void
        {
            _showGuildTitle = value;
        }

        public static function get showRoleTitle():Boolean
        {
            return _showRoleTitle;
        }

        public static function set showRoleTitle(value:Boolean):void
        {
            _showRoleTitle = value;
        }
    }
}