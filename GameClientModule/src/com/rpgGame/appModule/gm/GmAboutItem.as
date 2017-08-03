package com.rpgGame.appModule.gm
{
    import starling.display.Sprite;

    public class GmAboutItem extends Sprite 
    {

        public function GmAboutItem()
        {
            init();
        }

        private function init():void
        {
            var gmItem:GmItem = new GmItem();
            addChild(gmItem);
        }
    }
}