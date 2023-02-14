import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";

import Nat32Module "Nat32";

module {

    public func fromNat(n : Nat) : Char {
        Char.fromNat32(Nat32.fromNat(n));
    };

    public func toLowercase(c : Char) : Char {
        if (Char.isUppercase(c)) {
            let n = Char.toNat32(c);

            //difference between the nat32 values of 'a' and 'A'
            let diff : Nat32 = 32;
            return Char.fromNat32(n + diff);
        };

        return c;
    };

    public func toUppercase(c : Char) : Char {
        if (Char.isLowercase(c)) {
            let n = Char.toNat32(c);

            //difference between the nat32 values of 'a' and 'A'
            let diff : Nat32 = 32;
            return Char.fromNat32(n - diff);
        };

        return c;
    };

    public func isAlphanumeric(c : Char) : Bool {
        Char.isDigit(c) or Char.isAlphabetic(c);
    };

    public func toHexDigit(char : Char) : Nat8 {
        let charCode = Char.toNat32(char);

        if (Char.isDigit(char)) {
            let digit = charCode - Char.toNat32('0');

            return Nat32Module.toNat8(digit);
        };

        if (Char.isUppercase(char)) {
            let digit = charCode - Char.toNat32('A') + 10;

            return Nat32Module.toNat8(digit);
        };

        // lowercase
        let digit = charCode - Char.toNat32('a') + 10;

        return Nat32Module.toNat8(digit);
    };

};
