package gameEngine2D {
    public interface ICache {
        function get(key : String) : IDispose;
        function put(key : String, value : IDispose) : void;
        function hasKey(key : String) : Boolean;
        function remove(key : String) : void;
        function removeAll() : void;
    }
}
