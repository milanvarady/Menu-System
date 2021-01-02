/// @func roundToN(num, decimal_places)

/// @desc Rounds a number to n decimal places

/// @param {real} num               The number to round
/// @param {real} decimal_places    The number of decimal places to round to

/// @returns {real}

function roundToN(num, dec) {
    var rounding_method = sign(num) >= 0 ? floor : ceil
    
    dec = power(10, dec);
    return rounding_method(num * dec) / dec;
}